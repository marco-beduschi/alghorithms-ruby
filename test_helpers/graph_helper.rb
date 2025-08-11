module GraphHelper
  Edge = Struct.new(:to, :weight)

  def self.list1
    [
      [Edge.new(1, 3), Edge.new(2, 1)],                    # node 0
      [Edge.new(0, 3), Edge.new(2, 4), Edge.new(4, 1)],    # node 1
      [Edge.new(1, 4), Edge.new(3, 7), Edge.new(0, 1)],    # node 2
      [Edge.new(2, 7), Edge.new(4, 5), Edge.new(6, 1)],    # node 3
      [Edge.new(1, 1), Edge.new(3, 5), Edge.new(5, 2)],    # node 4
      [Edge.new(6, 1), Edge.new(4, 2), Edge.new(2, 18)],   # node 5
      [Edge.new(3, 1), Edge.new(5, 1)]                     # node 6
    ]
  end

  def self.list2
    [
      [Edge.new(1, 3), Edge.new(2, 1)],                    # node 0
      [Edge.new(4, 1)],                                    # node 1
      [Edge.new(3, 7)],                                    # node 2
      [],                                                  # node 3
      [Edge.new(1, 1), Edge.new(3, 5), Edge.new(5, 2)],   # node 4
      [Edge.new(2, 18), Edge.new(6, 1)],                  # node 5
      [Edge.new(3, 1)]                                     # node 6
    ]
  end

  def self.matrix2
    [
      [0, 3, 1,  0, 0, 0, 0], # 0
      [0, 0, 0,  0, 1, 0, 0], # 1
      [0, 0, 7,  0, 0, 0, 0], # 2
      [0, 0, 0,  0, 0, 0, 0], # 3
      [0, 1, 0,  5, 0, 2, 0], # 4
      [0, 0, 18, 0, 0, 0, 1], # 5
      [0, 0, 0,  1, 0, 0, 1]  # 6
    ]
  end
end