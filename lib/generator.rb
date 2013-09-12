require 'fileutils'

module OldFashion
  class Generator

    BASE_DIR = "old_fashioned"

    def initialize(args)
      @subcommand = args.first;
    end

    def run
      if @subcommand == "install"
        install
      elsif @subcommand == "update"
        update
      elsif @subcommand == "remove"
        remove
      end
    end

    def update
      if has_previous_install?
        remove_files
        install_files
        puts "An Old Fashioned Update."
      else
        puts "Nothing to update, Old Fashioned doesn't exist."
      end
    end

    def install
      if has_previous_install?
        puts "Old Fashioned is already installed, try an update"
      else
        install_files
        puts "Old Fashioned has been installed into #{BASE_DIR}/"
      end
    end

    def remove
      if has_previous_install?
        remove_files
        puts "Old Fashioned has been removed"
      else
        puts "Nothing to remove, Old Fashioned doesn't exist."
      end
    end

    private

    def has_previous_install?
      File.directory?(BASE_DIR)
    end

    def install_files
      FileUtils.mkdir_p(BASE_DIR)
      FileUtils.cp_r(all_stylesheets, "#{BASE_DIR}/")
    end

    def remove_files
      FileUtils.rm_rf(BASE_DIR)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end