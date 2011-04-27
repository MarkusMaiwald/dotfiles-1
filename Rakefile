# Adapted from Ryan Bates's dotfiles rakefile
# https://github.com/ryanb/dotfiles

require 'rake'

desc "install dotfiles"

task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
    path = File.join(ENV['HOME'], ".#{file}")
    if File.exist?(path) || File.symlink?(path)
      puts "removing existing ~/.#{file}"
      system %Q{rm -rf "$HOME/.#{file}"}
    end
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

