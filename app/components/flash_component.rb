# frozen_string_literal: true

class FlashComponent < ViewComponent::Base
  ALERT_KEYS = %i[default info success warning error].freeze
  INFO_FLASH_KEYS = %i[notice].freeze
  ERROR_FLASH_KEYS = %i[alert error].freeze

  def initialize(flash:)
    @flash = flash

    super()
  end

  private

  attr_reader :flash

  def flash_messages
    return @_flash_messages if @_flash_messages

    @_flash_messages = flash.each_with_object({}) do |(key, message), messages|
      next if message.blank?

      key = flash_message_key(key)

      next unless ALERT_KEYS.include?(key)

      messages[key] = messages[key].blank? ? message : "#{messages[key]}<br>#{message}"
    end
  end

  def flash_message_key(flash_key)
    if INFO_FLASH_KEYS.include?(flash_key.to_sym)
      :info
    elsif ERROR_FLASH_KEYS.include?(flash_key.to_sym)
      :error
    else
      :default
    end
  end

  def flash_alert_component_class(flash_message_key)
    case flash_message_key
    when :info
      DaisyUi::InfoAlertComponent
    when :error
      DaisyUi::ErrorAlertComponent
    else
      DaisyUi::AlertComponent
    end
  end

  def flash_alert_icon_component_class(flash_message_key)
    case flash_message_key
    when :info
      DaisyUi::InfoAlertIconComponent
    when :error
      DaisyUi::ErrorAlertIconComponent
    else
      DaisyUi::InfoAlertIconComponent
    end
  end

  def flash_alert_button_component_class(flash_message_key)
    case flash_message_key
    when :info
      DaisyUi::InfoGhostButtonComponent
    when :error
      DaisyUi::ErrorGhostButtonComponent
    else
      DaisyUi::GhostButtonComponent
    end
  end
end
