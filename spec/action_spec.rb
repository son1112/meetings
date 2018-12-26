require_relative '../app/action'

describe Action do
  context 'with valid data' do
    let(:detail) { 'run collection via api'}
    let(:wait_time) { Time.now + 30 }
    let(:new_action) { Action.new(detail, wait_time) }

    it 'initializes' do
      action = new_action
      expect(action.detail).to eq(detail)
      expect(action.expect_by).to eq(wait_time)
    end

    context 'detail is' do
      it 'a string'
    end
    context 'expect_by is' do
      it 'a datetime'
    end
  end
  context 'with invalid data' do
    context 'detail is' do
      context 'nil'
      context 'empty'
      context 'not a string'
    end
  end
end
