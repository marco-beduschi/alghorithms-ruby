module TreeHelper
  BinaryNode = Struct.new(:value, :left, :right)

  def self.tree
    BinaryNode.new(20,
      BinaryNode.new(10,
        BinaryNode.new(5,
          nil,
          BinaryNode.new(7, nil, nil)
        ),
        BinaryNode.new(15, nil, nil)
      ),
      BinaryNode.new(50,
        BinaryNode.new(30,
          BinaryNode.new(29, nil, nil),
          BinaryNode.new(45, nil, nil)
        ),
        BinaryNode.new(100, nil, nil)
      )
    )
  end

  def self.tree2
    BinaryNode.new(20,
      BinaryNode.new(10,
        BinaryNode.new(5,
          nil,
          BinaryNode.new(7, nil, nil)
        ),
        BinaryNode.new(15, nil, nil)
      ),
      BinaryNode.new(50,
        BinaryNode.new(30,
          BinaryNode.new(29,
            BinaryNode.new(21, nil, nil),
            nil
          ),
          BinaryNode.new(45,
            nil,
            BinaryNode.new(49, nil, nil)
          )
        ),
        nil
      )
    )
  end
end