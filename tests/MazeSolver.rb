require 'minitest/autorun'

class MazeSolverTest < Minitest::Test
  Point = Struct.new(:x, :y)

  def test_maze_solver
    # Assuming there's a maze solver implementation to require
    # require_relative '../maze_solver'

    maze = [
      "xxxxxxxxxx x",
      "x        x x",
      "x        x x",
      "x xxxxxxxx x",
      "x          x",
      "x xxxxxxxxxx",
    ]

    maze_result = [
      Point.new(10, 0),
      Point.new(10, 1),
      Point.new(10, 2),
      Point.new(10, 3),
      Point.new(10, 4),
      Point.new(9, 4),
      Point.new(8, 4),
      Point.new(7, 4),
      Point.new(6, 4),
      Point.new(5, 4),
      Point.new(4, 4),
      Point.new(3, 4),
      Point.new(2, 4),
      Point.new(1, 4),
      Point.new(1, 5),
    ]

    # there is only one path through
    result = maze_solver_mock(maze, "x", Point.new(10, 0), Point.new(1, 5))
    assert_equal draw_path(maze, maze_result), draw_path(maze, result)
  end

  private

  def draw_path(data, path)
    data2 = data.map { |row| row.chars }
    path.each do |p|
      if data2[p.y] && data2[p.y][p.x]
        data2[p.y][p.x] = '*'
      end
    end
    data2.map(&:join)
  end

  # Mock maze solver implementation using recursion with backtracking
  def maze_solver_mock(maze, wall, start, end_point)
    seen = Array.new(maze.length) { Array.new(maze[0].length, false) }
    path = []

    walk(maze, wall, start, end_point, seen, path)

    path
  end

  def walk(maze, wall, curr, end_point, seen, path)
    # Base cases
    # 1. Off the map
    return false if curr.x < 0 || curr.x >= maze[0].length ||
                    curr.y < 0 || curr.y >= maze.length

    # 2. On a wall
    return false if maze[curr.y][curr.x] == wall

    # 3. At the end
    if curr.x == end_point.x && curr.y == end_point.y
      path << curr
      return true
    end

    # 4. If we have seen it
    return false if seen[curr.y][curr.x]

    # 3 recursive cases
    # pre
    seen[curr.y][curr.x] = true
    path << curr

    # recurse
    directions = [
      Point.new(1, 0),   # right
      Point.new(-1, 0),  # left
      Point.new(0, 1),   # down
      Point.new(0, -1),  # up
    ]

    directions.each do |dir|
      next_point = Point.new(curr.x + dir.x, curr.y + dir.y)
      if walk(maze, wall, next_point, end_point, seen, path)
        return true
      end
    end

    # post
    path.pop

    false
  end
end