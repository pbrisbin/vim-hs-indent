module EditedFile
  def file
    @file ||= Content.new(vim)
  end

  def edit(&block)
    file.edit(&block)
  end

  def contents
    file.contents
  end

  class Content
    attr_reader :file_name

    def initialize(vim)
      @vim = vim
      @file_name = "/tmp/file.hs"
    end

    def edit
      @vim.edit(file_name)

      yield

      @vim.write
    end

    def contents
      File.read(file_name).chomp
    end

    def remove
      File.unlink(file_name) if File.exist?(file_name)
    end
  end
end

RSpec.configure do |config|
  config.include(EditedFile)
  config.before(:each) { file.remove }
end
