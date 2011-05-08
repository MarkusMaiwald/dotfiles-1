# Adapted from Ryan Bates's dotfiles rakefile
# https://github.com/ryanb/dotfiles

require 'fileutils'

IGNORES = %w{Rakefile README.md LICENSE}
NO_DOTS = %w{bin}

task :default => :install

desc "install dotfiles"
task :install do
  Dir['*'].each do |file|
    next if IGNORES.include? file
    path = install_path_for file
    if File.exist?(path) || File.symlink?(path)
      puts "Removing #{path}"
      FileUtils.rm_rf path
    end
    puts "Linking #{path}"
    FileUtils.ln_s File.join(Dir.pwd, file), path
  end
end

def install_path_for file
  basename = (NO_DOTS.include? file) && file || ".#{file}"
  File.join(ENV['HOME'], basename)
end
