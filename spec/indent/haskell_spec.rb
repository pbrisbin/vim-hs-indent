require 'spec_helper'

describe "Haskell indentation" do
  context "Module exports" do
    it "indents multi-line exports correctly" do
      edit do
        vim.insert("module Main\n( one\n, two\n, three )\n")
      end

      expect(file.contents).to eq dedent(<<-EOF)
        module Foo
            ( one
            , two
            , three
            )
      EOF
    end
  end
end
