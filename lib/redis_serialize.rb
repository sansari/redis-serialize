module RedisSerialize

  def self.included(base)
    
    base.class_eval do
      def self.list_name
        @@list_name
      end

      def self.list_name=(name)
        @@list_name = name
      end

      def self.redis_serialize(name)
        self.list_name = name

        def key
          send("#{self.class.list_name}_key")
        end

        define_method "#{name}_key" do
          "#{self.class.name.gsub(/(.)([A-Z])/,'\1_\2').downcase}:#{self.id}:list:#{self.class.list_name}"
        end

        define_method name do
          REDIS.smembers(key)
        end

        define_method "#{name}_add" do |*items|
          items.to_a.flatten.tap do |items|
            items.each do |item|
              REDIS.sadd(key, item)
            end
          end.uniq
        end

        define_method "#{name}_remove" do |item|
          REDIS.srem(key, item)
        end

        define_method "#{name}_set" do |*items|
          REDIS.del(key)

          send("#{name}_add", items)
        end

        define_method "#{name}_include?" do |item|
          REDIS.sismember(key, item)
        end

        define_method "#{name}_size" do
          REDIS.scard(key)
        end
      end
    end
  end
end
