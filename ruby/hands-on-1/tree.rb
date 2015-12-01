class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end

  def self.from(tree)
    name = tree.keys[0]
    children = []
    tree.values[0].keys.each do |child|
        childValue = tree.values[0][child]
        children.push(self.from({
            child => tree.values[0][child]
          }))
    end

    Tree.new(name, children)
  end
end

ruby_tree = Tree.new( "Ruby",
  [Tree.new("Reia"),
   Tree.new("MacRuby")] )

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

puts "new way of tree"
family_tree = Tree.from(
  {
    'grandpa' => {
      'dad' => {
        'child 1' => {},
        'child 2' => {}
        },
      'uncle' => {
        'child 3' => {},
        'child 4' => {}
      }
    }
  }
)

puts "visiting family tree"
family_tree.visit_all {|node| puts node.node_name}
