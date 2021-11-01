# Ruby-staudy

## FizzBuzzプログラムの作成
- 3で割り切れる数値を引数に渡すと、“Fizz”を返す。
- 5で割り切れる数値を引数に渡すと、“Buzz”を返す。・
- 15で割り切れる数値を引数に渡すと、“FizzBuzz”を返す。
- それ以外の数値はその数値を文字列に変えて返す。

#### 出力コマンドについて
 ![](https://gyazo.com/88f67ddb6132955ef2f8da8d021d594c/raw)


 high_motivation_user_aggregator.rb
require 'json'

class HighMotivationUserAggregator
  attr_accessor :channel_names

  def initialize(channel_names)
    @channel_names = channel_names
  end

  def exec
    output = channel_names.map do |channel_name|
      conversation = load(channel_name)
      messages = conversation['messages']
      message_count = messages.count 
      {
        channel_name: channel_name,
        message_count: message_count
      }
    end

    output.max_by(3) { |o| o[:message_count] }
  end

  def load(channel_name)
    file = File.open(channel_name)
    JSON.load(file)
  end
end


kind_user_aggregator.rb
require 'json'

class KindUserAggregator
  attr_accessor :channel_names

  def initialize(channel_names)
    @channel_names = channel_names
  end

  def exec
    conversations = channel_names.map do |channel_name|
      load(channel_name)
    end

    reaction_users = conversations.flat_map do |item|
      messages = item['messages']
      messages_having_reactions = messages.filter { |message| !message['reactions'].nil? }
      reactions = messages_having_reactions.flat_map { |message| message['reactions'] }
      reaction_users = reactions.flat_map { |reaction| reaction['users'] }
      reaction_users
    end
    reaction_users.group_by(&:itself).map { |k, v| [k, v.size] }.to_h.max_by(3) {|_, v| v }.map do |user_id_and_reaction_count|
      {
        user_id: user_id_and_reaction_count.first,
        reaction_count: user_id_and_reaction_count.last
      }
    end
  end

  def load(channel_name)
    file = File.open(channel_name)
    JSON.load(file)
  end
end
poupular_message_aggregator.rb
class PopularMessageAggregator
  attr_accessor :channel_names

  def initialize(channel_names)
    @channel_names = channel_names
  end

  def exec
    conversations = channel_names.map do |channel_name|
      load(channel_name)
    end

    reaction_count_hash = conversations.flat_map do |item|
      messages = item['messages']
      messages_having_reactions = messages.filter { |message| !message['reactions'].nil? }
      messages_having_reactions.flat_map do |message|
        {
          text: message['text'],
          reaction_count: message['reactions'].map { |reaction| reaction['count'] }.inject { |sum, count| sum + count }
        }
      end
    end
    reaction_count_hash.max_by(1) { |hash| hash[:reaction_count] }.first
  end

  def load(channel_name)
    file = File.open(channel_name)
    JSON.load(file)
  end
end
