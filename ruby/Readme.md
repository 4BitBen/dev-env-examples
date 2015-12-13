# Pre-Requisites
* Vagrant
* VM Provider, like VirtualBox

# Install
````
vagrant up
vagrant ssh
cd /vagrant
rails new blog
cd blog
bin/rails server --binding=0.0.0.0
````
Go to [http://192.168.30.10:3000](http://192.168.30.10:3000)

Follow [Rails Getting Started Guide](http://guides.rubyonrails.org/getting_started.html#hello-rails-bang)