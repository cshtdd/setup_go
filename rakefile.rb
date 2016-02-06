task :default => :setup

task :setup do
    go_path = read_variable "What do you want your $GOPATH to be? e.g. $HOME/devroot/go", "$HOME/devroot/go"
    username = read_variable "Enter your github username e.g. codingdog", "user"

    dir_to_create = "#{go_path}/src/github.com/#{username}"
    puts "Creating directory #{dir_to_create}"
end

def read_variable(message, default_value)
    puts message
    user_input = STDIN.gets.chomp
    user_input = default_value unless user_input.length > 0
    user_input
end
