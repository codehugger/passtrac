namespace :simulate do
  desc "Simulate Assets walking around in a 100x100 environment"
  task :assets => :environment do
    class Agent
      attr_reader :asset, :x, :y
      def initialize(asset = nil, posx = nil, posy = nil)
        @asset = asset
        @x = posx || Random.rand(100)
        @y = posy || Random.rand(100)
      end

      def walk(step = 1)
        step = step.abs
        @x = (@x + Random.rand(-step..step)) % 100
        @y = (@y + Random.rand(-step..step)) % 100
      end

      def save
        @asset.positions.create(x: @x, y: @y)
      end
    end

    while true
      agents = Asset.all.map { |a| Agent.new(a, a.position.try(:x) || 0, a.position.try(:y) || 0) }
      agents.each do |agent|
        agent.walk(1)
        puts "#{agent.asset.name}, #{agent.asset.position.try(:x)}, #{agent.asset.position.try(:y)}"
        agent.save
      end
      sleep 2
    end
  end
end
