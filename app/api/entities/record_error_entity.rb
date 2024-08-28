module Entities
  class RecordErrorEntity < Grape::Entity
    expose :error, documentation: {
      type: String,
      desc: 'Summary error messages',
      example: 'Required field is missing'
    }
    expose :messages, documentation: {
      type: String,
      desc: 'Detail per error',
      is_array: true,
      example: ['First name is missing', 'Last name is missing']
    }
  end
end
