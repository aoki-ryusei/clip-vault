class BaseApi
  def initialize
    # モジュール名を取得
    module_name = self.class.name.split('::').first
    class_name = self.class.name.split('::').last

    # ログディレクトリとファイルパスを構築
    log_dir = Rails.root.join("log/#{module_name}/#{class_name}")
    FileUtils.mkdir_p(log_dir) unless File.directory?(log_dir)

    log_file = log_dir.join("#{Time.now.strftime('%Y%m%d')}.log")

    # ロガーを作成
    @logger = Logger.new(log_file)
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "[#{datetime}] #{severity}: #{msg}\n"
    end
  end

  # ログメソッドを提供
  def log_info(message)
    @logger.info(message)
  end

  def log_error(message)
    @logger.error(message)
  end

  def log_debug(message)
    @logger.debug(message)
  end
end
