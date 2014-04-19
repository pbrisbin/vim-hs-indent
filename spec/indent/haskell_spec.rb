require 'spec_helper'

describe "Haskell indentation" do
  it "indents multi-line exports correctly" do
    edit do
      vim.insert dedent(<<-EOF)
        module Main
        ( one
        , two
        , three
        )
      EOF
    end

    expect(contents).to eq dedent(<<-EOF)
      module Main
          ( one
          , two
          , three
          )
    EOF
  end

  it "indents sum types correctly" do
    edit do
      vim.insert dedent(<<-EOF)
        data Colors
        = Red
        | Blue
        | Yellow
      EOF
    end

    expect(contents).to eq dedent(<<-EOF)
      data Colors
          = Red
          | Blue
          | Yellow
    EOF
  end

  it "indents record types correctly" do
    edit do
      vim.insert dedent(<<-EOF)
        data Person = Person
        { age :: Int
        , name :: String
        }
      EOF
    end

    expect(contents).to eq dedent(<<-EOF)
      data Person = Person
          { age :: Int
          , name :: String
          }
    EOF
  end
end
