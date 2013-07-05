namespace :db do
  desc "Delete all photos, tags, and phototags"
  task :remove_all_non_user_records => :environment do
    Photo.all.each { |p| p.destroy }
    PhotoTag.all.each { |pt| pt.destroy }
    Tag.all.each { |t| t.destroy }
  end
end