require 'spec_helper'

describe Idea do

  it { should validate_presence_of(:name) }

end