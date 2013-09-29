require 'simplecov'

SimpleCov.start unless ENV['CI']

shared_examples 'humr_handler' do |name,handler_class|
  it "is registered as :#{name}" do
    expect(Humr::Handler[name]).to be(handler_class)
  end

  describe '#name' do
    it "is :#{name}" do
      expect(subject.name).to be(name)
    end
  end
end

require 'term/ansicolor'

class String
  include Term::ANSIColor
end
