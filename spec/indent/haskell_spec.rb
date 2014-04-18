require 'spec_helper'

describe "Haskell indentation" do
  context "Module exports" do
    it "indents multi-line exports correctly" do
      edit do
        vim.insert dedent(<<-EOF)
          module Main
          ( one
          , two
          , three
          )

          main :: IO ()
          main = hPutStrLn "Hello World"
        EOF
      end

      expect(contents).to eq dedent(<<-EOF)
        module Main
            ( one
            , two
            , three
            )

        main :: IO ()
        main = hPutStrLn "Hello World"
      EOF
    end
  end
end
