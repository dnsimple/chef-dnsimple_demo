# ChefConf 2017 Demo

This is our "booth" demo which stands up a Digital Ocean instance, installs nginx and a demo page then pings the dnsimple API to update the IP address of a domain with the instance IP.

## Demo Setup

* `curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -P chefdk`
* `chef gem install kitchen-digitalocean`
* Set up direnv if you have not already
    * `brew install direnv`
    * add to your shell with `eval "$(direnv hook bash)"` or whatever the equivilant is for your shell
* Set up the digital ocean API key (Make sure you create one from the Ops testing team)
    * log into Digital Ocean
    * Click API in the top bar
    * Genrate new token button with a descriptive name
    * run `direnv edit .` and add this token under `export DIGITALOCEAN_ACCESS_TOKEN=`
* Add an SSH key to your account (an ssh key you can easily load or use is required)
    * click on the profile image on the top right (green D with your image small in the corner)
    * Click Security under developers
    * click add ssh key
    * Paste your key and name it your username for identification & save
    * run `./get_do_key.sh` and find the `id` for your key
    * run `direnv edit .` and add id number under `export DIGITALOCEAN_SSH_KEY_IDS=`
* A dnsimple account token
    * run `direnv edit .` and add this token under `export DNSIMPLE_ACCESS_TOKEN=`
* A test node id in your environment
    * pick a random number and set it in your env
    * run `direnv edit .` and add this token under  `export DNSIMPLE_DEMO_ID=`
* verify your .envrc file looks like below when you run `direnv edit .`

### env file example
The `.envrc` file must be in bash no matter what your actual shell is

```bash
export DIGITALOCEAN_ACCESS_TOKEN=big_long_string
export DIGITALOCEAN_SSH_KEY_IDS=int
export DNSIMPLE_ACCESS_TOKEN=token
export DNSIMPLE_DEMO_ID=int
```

## Doing the Demo

## Make the magic happen

* `./demo.sh`
* show off our cool website just for them

## Reset for the next demo

* `./destroy.sh`

## Manually reset for the next demo

* Login to the operations test account and manually destroy the node, the IP address will get updated on the next chef run
