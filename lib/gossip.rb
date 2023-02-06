# frozen_string_literal: true

require 'pry'
require 'csv'

# Create gossip class
class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    system 'clear'
    @author = author
    @content = content
  end

  def save
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  def self.find(id)
    p all[id]
  end

  # Partie en cours de développement, non fonctionnelle 
  # def self.update(id, author, content)
  #   temp = []
  #   target = find(id)
  #   CSV.read('./db/gossip.csv') do |csv|
  #     if csv['id'].to_i == target
  #       target.author = author
  #       target.content = content
  #       temp << Gossip.new(author, content)
  #     else
  #       temp << csv
  #     end
  #   end

  #   CSV.open('db/gossip.csv', 'w') do |csv|
  #     temp.each do |gossip|
  #       csv << gossip
  #     end
  #   end
  # end
end
