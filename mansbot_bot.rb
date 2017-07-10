require 'telegram/bot'
require 'dotenv'

Dotenv.load('.env')
token = ENV['TELEGRAM_BOT_API_KEY']


def telegram_send(bot, message, s_message)
  bot.api.sendMessage(chat_id: message.chat.id, text: s_message)
end

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      telegram_send(bot, message, "Привет, #{message.from.first_name}. Сколько раз ты хочешь, что бы жируша отжалась? 10 раз? 20? 30?:)")
    when '10'
      telegram_send(bot, message, "Жируша! Быстро отожмись 10 раз!")
    when '20'
      telegram_send(bot, message, "Жируша! Спорим, 20 раз ты не осилишь!?")
    when '30'
      telegram_send(bot, message, "Ну, 30 раз Жируша точно не смогЁт!)")
    when /^\d+$/
      telegram_send(bot, message, "Чет не то ты пишешь -_-")
    end
  end
end
