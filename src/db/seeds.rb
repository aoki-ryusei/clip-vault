# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Game.create!([
  # VCR
  { id: 32982, name: "Grand Theft Auto V", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/32982_IGDB-{width}x{height}.jpg", igdb_id: 1020 },
  { id: 263490, name: "Rust", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/263490_IGDB-{width}x{height}.jpg", igdb_id: 3277 },
  { id: 489635, name: "ARK: Survival Evolved", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/489635-{width}x{height}.jpg", igdb_id: 10239 },
  { id: 27471, name: "Minecraft", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/27471_IGDB-{width}x{height}.jpg", igdb_id: 135400 },
  # CR cup
  { id: 516575, name: "VALORANT", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/516575-{width}x{height}.jpg", igdb_id: 126459 },
  { id: 511224, name: "Apex Legends", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/511224-{width}x{height}.jpg", igdb_id: 114795 },
  { id: 33214, name: "Fortnite", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/33214-{width}x{height}.jpg", igdb_id: 1905 },
  { id: 491168, name: "Clash Royale", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/491168_IGDB-{width}x{height}.jpg", igdb_id: 15707 },
  { id: 515025, name: "Overwatch 2", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/515025-{width}x{height}.jpg", igdb_id: 125174 },
  { id: 55453844, name: "Street Fighter 6", image_url: "https://static-cdn.jtvnw.net/ttv-boxart/55453844_IGDB-{width}x{height}.jpg", igdb_id: 191692 }
])
