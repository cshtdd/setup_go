task :default => :setup

task :setup do
    go_path = read_variable "What do you want your $GOPATH to be? e.g. $HOME/devroot/go", "$HOME/devroot/go"
    create_source_folder go_path
    init_variables go_path unless go_path_has_already_been_set
end

task :debug do
    actual_go_path = `echo $GOPATH`
    puts "$GOPATH: #{actual_go_path}"
end

def read_variable(message, default_value)
    puts message
    user_input = STDIN.gets.chomp
    user_input = default_value unless user_input.length > 0
    user_input
end

def create_source_folder(go_path)
    username = read_variable "Enter your github username e.g. codingdog", "user"

    dir_to_create = "#{go_path}/src/github.com/#{username}"
    puts "Creating directory #{dir_to_create}"
    sh "mkdir -p #{dir_to_create}"
end

def init_variables(go_path)
    home_path = ENV['HOME']
    bash_profile_path = "#{home_path}/.bash_profile"
    puts "Modifying #{bash_profile_path}..."

    open(bash_profile_path, 'a') do |f|
        f.puts
        f.puts "##Generated code START"
        f.puts "export GOPATH=#{go_path}"
        f.puts "export GOROOT=/usr/local/opt/go/libexec"
        f.puts "export PATH=$PATH:$GOPATH/bin"
        f.puts "export PATH=$PATH:$GOROOT/bin"
        f.puts "##Generated code END"
        f.puts
    end

    puts "MAKE SURE TO OPEN A NEW TERMINAL"
end

def go_path_has_already_been_set
    bash_profile_contents = `cat $HOME/.bash_profile`
    return bash_profile_contents.include? "GOPATH"
end
