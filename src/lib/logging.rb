module Logging
  require "logger"

  def log_info(message, path = nil)
    set_logger path
    @logger.info(message)
  end

  def log_error(message, path = nil)
    set_logger path
    @logger.error(message)
  end

  def log_debug(message, path = nil)
    set_logger path
    @logger.debug(message)
  end

  private
  def set_logger(path)
    if path.nil?
      # モジュール名を取得
      module_name = self.class.name.split("::").first
      class_name = self.class.name.split("::").last
      log_path = "log/#{module_name}/#{class_name}"
    else
      log_path = "log/#{path}"
    end

    # ログディレクトリとファイルパスを構築
    log_dir = Rails.root.join(log_path)
    FileUtils.mkdir_p(log_dir) unless File.directory?(log_dir)

    log_file = log_dir.join("#{Time.now.strftime('%Y%m%d')}.log")

    # ロガーを作成
    @logger = Logger.new(log_file)
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "[#{datetime}] #{severity}: #{msg}\n"
    end
  end
end
