require 'spec_helper'
require 'fakefs/spec_helpers'

# fake the lxc-api
module Lxc
  class Image
  end
  class Container
  end
end

module Beaker
  platforms = [
    "ubuntu-18.04-x86_64"
  ]

  #TODO: Taken from beaker-docker. Needs to be implemented

  describe Lxc do
    # let(:hosts) {
    #   the_hosts = make_hosts
    #   the_hosts
    # }
    #
    # let(:logger) do
    #   logger = double('logger')
    #   allow( logger ).to receive(:debug)
    #   allow( logger ).to receive(:info)
    #   allow( logger ).to receive(:warn)
    #   allow( logger ).to receive(:error)
    #   allow( logger ).to receive(:notify)
    #   logger
    # end
    #
    # let(:options) {{
    #   :logger => logger,
    #   :forward_ssh_agent => true,
    #   :provision => true,
    # }}
    #
    # let(:image) do
    #   image = double('Lxc::Image')
    #   allow( image ).to receive(:id).and_return("zyxwvu")
    #   allow( image ).to receive(:tag)
    #   image
    # end
    #
    # let(:container) do
    #   container = double('Lxc::Container')
    #   allow( container ).to receive(:id).and_return('abcdef')
    #   allow( container ).to receive(:start)
    #   allow( container ).to receive(:info).and_return(
    #     *(0..2).map { |index| { 'Names' => ["/spec-container-#{index}"] } }
    #   )
    #   allow( container ).to receive(:json).and_return({
    #     'NetworkSettings' => {
    #       'IPAddress' => '192.0.2.1',
    #       'Ports' => {
    #         '22/tcp' => [
    #           {
    #             'HostIp' => '127.0.1.1',
    #             'HostPort' => 8022,
    #           },
    #         ],
    #       },
    #       'Gateway' => '192.0.2.254'
    #     }
    #   })
    #   allow( container ).to receive(:kill)
    #   allow( container ).to receive(:delete)
    #   allow( container ).to receive(:exec)
    #   container
    # end
    #
    # let (:lxc) { ::Beaker::Lxc.new( hosts, options ) }
    # let (:version) { {"ApiVersion"=>"1.18", "Arch"=>"amd64", "GitCommit"=>"4749651", "GoVersion"=>"go1.4.2", "KernelVersion"=>"3.16.0-37-generic", "Os"=>"linux", "Version"=>"1.6.0"} }
    #
    # before :each do
    #   # Stub out all of the lxc gem. we should never really call it
    #   # from these tests
    #   allow_any_instance_of( ::Beaker::Lxc ).to receive(:require).with('lxc')
    #   allow( ::Lxc ).to receive(:options=)
    #   allow( ::Lxc ).to receive(:logger=)
    #   allow( ::Lxc ).to receive(:version).and_return(version)
    #   allow( ::Lxc::Image ).to receive(:build).and_return(image)
    #   allow( ::Lxc::Image ).to receive(:create).and_return(image)
    #   allow( ::Lxc::Container ).to receive(:create).and_return(container)
    #   allow_any_instance_of( ::Lxc::Container ).to receive(:start)
    # end
    #
    # describe '#initialize' do
    #   before :each do
    #     allow( ::Lxc ).to receive(:validate_version!)
    #   end
    #
    #   it 'should require the ruby lxc gem' do
    #     expect_any_instance_of( ::Beaker::Lxc ).to receive(:require).with('lxc').once
    #   end
    #
    #   it 'should fail when the gem is absent' do
    #     allow_any_instance_of( ::Beaker::Lxc ).to receive(:require).with('lxc').and_raise(LoadError)
    #     expect { docker }.to raise_error(LoadError)
    #   end
    #
    #   it 'should set Lxc options' do
    #     expect( ::Lxc ).to receive(:options=).with({:write_timeout => 300, :read_timeout => 300}).once
    #
    #     docker
    #   end
    #
    #   context 'when Lxc options are already set' do
    #     let(:docker_options) {{:write_timeout => 600, :foo => :bar}}
    #
    #     it 'should not override Lxc options' do
    #       expect( ::Lxc ).to receive(:options=).with({:write_timeout => 600, :read_timeout => 300, :foo => :bar}).once
    #
    #       docker
    #     end
    #   end
    #
    #   it 'should check the Lxc gem can work with the api' do
    #     expect( ::Lxc ).to receive(:validate_version!).once
    #
    #     docker
    #   end
    #
    #   it 'should hook the Beaker logger into the Lxc one' do
    #     expect( ::Lxc ).to receive(:logger=).with(logger)
    #
    #     docker
    #   end
    # end
    #
    # describe '#install_ssh_components' do
    #   let(:test_container) { double('container') }
    #   let(:host) {hosts[0]}
    #   before :each do
    #     allow( ::Lxc ).to receive(:validate_version!)
    #     allow( docker ).to receive(:dockerfile_for)
    #   end
    #
    #   platforms.each do |platform|
    #     it 'should call exec at least twice' do
    #       host['platform'] = platform
    #       expect(test_container).to receive(:exec).at_least(:twice)
    #       docker.install_ssh_components(test_container, host)
    #     end
    #   end
    #
    #   it 'should accept alpine as valid platform' do
    #     host['platform'] = 'alpine-3.8-x86_64'
    #     expect(test_container).to receive(:exec).at_least(:twice)
    #     docker.install_ssh_components(test_container, host)
    #   end
    #
    #   it 'should raise an error with an unsupported platform' do
    #     host['platform'] = 'boogeyman-2000-x86_64'
    #     expect{docker.install_ssh_components(test_container, host)}.to raise_error(RuntimeError, /boogeyman/)
    #   end
    # end
    #
    # describe '#provision' do
    #   before :each do
    #     allow( ::Lxc ).to receive(:validate_version!)
    #     allow( docker ).to receive(:dockerfile_for)
    #   end
    #
    #   context 'when the host has "tag" defined' do
    #     before :each do
    #       hosts.each do |host|
    #         host['tag'] = 'my_tag'
    #       end
    #     end
    #
    #     it 'will tag the image with the value of the tag' do
    #       expect( image ).to receive(:tag).with({:repo => 'my_tag'}).exactly(3).times
    #       docker.provision
    #     end
    #   end
    #
    #   context 'when the host has "use_image_entry_point" set to true on the host' do
    #
    #     before :each do
    #       hosts.each do |host|
    #         host['use_image_entry_point'] = true
    #       end
    #     end
    #
    #     it 'should not call #dockerfile_for but run methods necessary for ssh installation' do
    #       expect( docker ).not_to receive(:dockerfile_for)
    #       expect( docker ).to receive(:install_ssh_components).exactly(3).times #once per host
    #       expect( docker ).to receive(:fix_ssh).exactly(3).times #once per host
    #       docker.provision
    #     end
    #   end
    #
    #   context 'when the host has a "dockerfile" for the host' do
    #
    #     before :each do
    #       allow( docker ).to receive(:buildargs_for).and_return('buildargs')
    #       hosts.each do |host|
    #         host['dockerfile'] = 'mydockerfile'
    #       end
    #     end
    #
    #     it 'should not call #dockerfile_for but run methods necessary for ssh installation' do
    #       allow( File ).to receive(:exist?).with('mydockerfile').and_return(true)
    #       allow( ::Lxc::Image ).to receive(:build_from_dir).with("/", hash_including(:rm => true, :buildargs => 'buildargs')).and_return(image)
    #       expect( docker ).not_to receive(:dockerfile_for)
    #       expect( docker ).to receive(:install_ssh_components).exactly(3).times #once per host
    #       expect( docker ).to receive(:fix_ssh).exactly(3).times #once per host
    #       docker.provision
    #     end
    #   end
    #
    #   it 'should call image create for hosts when use_image_as_is is defined' do
    #     hosts.each do |host|
    #       host['use_image_as_is'] = true
    #       expect( docker ).not_to receive(:install_ssh_components)
    #       expect( docker ).not_to receive(:fix_ssh)
    #       expect( ::Lxc::Image ).to receive(:create).with('fromImage' => host['image']) #once per host
    #       expect( ::Lxc::Image ).not_to receive(:build)
    #       expect( ::Lxc::Image ).not_to receive(:build_from_dir)
    #     end
    #
    #     docker.provision
    #   end
    #
    #   it 'should call dockerfile_for with all the hosts' do
    #     hosts.each do |host|
    #       expect( docker ).not_to receive(:install_ssh_components)
    #       expect( docker ).not_to receive(:fix_ssh)
    #       expect( docker ).to receive(:dockerfile_for).with(host).and_return('')
    #     end
    #
    #     docker.provision
    #   end
    #
    #   it 'should pass the Lxcfile on to Lxc::Image.create' do
    #     allow( docker ).to receive(:dockerfile_for).and_return('special testing value')
    #     expect( ::Lxc::Image ).to receive(:build).with('special testing value', { :rm => true, :buildargs => '{}' })
    #
    #     docker.provision
    #   end
    #
    #   it 'should pass the buildargs from ENV DOCKER_BUILDARGS on to Lxc::Image.create' do
    #     allow( docker ).to receive(:dockerfile_for).and_return('special testing value')
    #     ENV['DOCKER_BUILDARGS'] = 'HTTP_PROXY=http://1.1.1.1:3128'
    #     expect( ::Lxc::Image ).to receive(:build).with('special testing value', { :rm => true, :buildargs => "{\"HTTP_PROXY\":\"http://1.1.1.1:3128\"}" })
    #
    #     docker.provision
    #   end
    #
    #   it 'should create a container based on the Image (identified by image.id)' do
    #     hosts.each do |host|
    #       expect( ::Lxc::Container ).to receive(:create).with({
    #         'Image' => image.id,
    #         'Hostname' => host.name,
    #         'HostConfig' => {
    #           'PortBindings' => {
    #             '22/tcp' => [{ 'HostPort' => /\b\d{4}\b/, 'HostIp' => '0.0.0.0'}]
    #           },
    #           'PublishAllPorts' => true,
    #           'Privileged' => true,
    #           'RestartPolicy' => {
    #             'Name' => 'always'
    #           }
    #         },
    #         'Labels' => {
    #           'one' => 1,
    #           'two' => 2,
    #         },
    #       }).with(hash_excluding('name'))
    #     end
    #
    #     docker.provision
    #   end
    #
    #   it 'should pass the multiple buildargs from ENV DOCKER_BUILDARGS on to Lxc::Image.create' do
    #     allow( docker ).to receive(:dockerfile_for).and_return('special testing value')
    #     ENV['DOCKER_BUILDARGS'] = 'HTTP_PROXY=http://1.1.1.1:3128	HTTPS_PROXY=https://1.1.1.1:3129'
    #     expect( ::Lxc::Image ).to receive(:build).with('special testing value', { :rm => true, :buildargs => "{\"HTTP_PROXY\":\"http://1.1.1.1:3128\",\"HTTPS_PROXY\":\"https://1.1.1.1:3129\"}" })
    #
    #     docker.provision
    #   end
    #
    #   it 'should create a container based on the Image (identified by image.id)' do
    #     hosts.each do |host|
    #       expect( ::Lxc::Container ).to receive(:create).with({
    #         'Image' => image.id,
    #         'Hostname' => host.name,
    #         'HostConfig' => {
    #           'PortBindings' => {
    #             '22/tcp' => [{ 'HostPort' => /\b\d{4}\b/, 'HostIp' => '0.0.0.0'}]
    #           },
    #           'PublishAllPorts' => true,
    #           'Privileged' => true,
    #           'RestartPolicy' => {
    #             'Name' => 'always'
    #           }
    #         },
    #         'Labels' => {
    #           'one' => 1,
    #           'two' => 2,
    #         },
    #       }).with(hash_excluding('name'))
    #     end
    #
    #     docker.provision
    #   end
    #
    #   it 'should create a named container based on the Image (identified by image.id)' do
    #     hosts.each_with_index do |host, index|
    #       container_name = "spec-container-#{index}"
    #       host['docker_container_name'] = container_name
    #
    #       allow(::Lxc::Container).to receive(:all).and_return([])
    #       expect( ::Lxc::Container ).to receive(:create).with({
    #         'Image' => image.id,
    #         'Hostname' => host.name,
    #         'name' => container_name,
    #         'HostConfig' => {
    #           'PortBindings' => {
    #             '22/tcp' => [{ 'HostPort' => /\b\d{4}\b/, 'HostIp' => '0.0.0.0'}]
    #           },
    #           'PublishAllPorts' => true,
    #           'Privileged' => true,
    #           'RestartPolicy' => {
    #             'Name' => 'always'
    #           }
    #         },
    #         'Labels' => {
    #           'one' => (index == 2 ? 3 : 1),
    #           'two' => (index == 2 ? 4 : 2),
    #         },
    #       })
    #     end
    #
    #     docker.provision
    #   end
    #
    #
    #   it 'should create a container with volumes bound' do
    #     hosts.each_with_index do |host, index|
    #       host['mount_folders'] = {
    #         'mount1' => {
    #           'host_path' => '/source_folder',
    #           'container_path' => '/mount_point',
    #         },
    #         'mount2' => {
    #           'host_path' => '/another_folder',
    #           'container_path' => '/another_mount',
    #           'opts' => 'ro',
    #         },
    #         'mount3' => {
    #           'host_path' => '/different_folder',
    #           'container_path' => '/different_mount',
    #           'opts' => 'rw',
    #         },
    #         'mount4' => {
    #           'host_path' => './',
    #           'container_path' => '/relative_mount',
    #         },
    #         'mount5' => {
    #           'host_path' => 'local_folder',
    #           'container_path' => '/another_relative_mount',
    #         }
    #       }
    #
    #       expect( ::Lxc::Container ).to receive(:create).with({
    #         'Image' => image.id,
    #         'Hostname' => host.name,
    #         'HostConfig' => {
    #           'Binds' => [
    #             '/source_folder:/mount_point',
    #             '/another_folder:/another_mount:ro',
    #             '/different_folder:/different_mount:rw',
    #             "#{File.expand_path('./')}:/relative_mount",
    #             "#{File.expand_path('local_folder')}:/another_relative_mount",
    #           ],
    #           'PortBindings' => {
    #             '22/tcp' => [{ 'HostPort' => /\b\d{4}\b/, 'HostIp' => '0.0.0.0'}]
    #           },
    #           'PublishAllPorts' => true,
    #           'Privileged' => true,
    #           'RestartPolicy' => {
    #             'Name' => 'always'
    #           }
    #         },
    #         'Labels' => {
    #           'one' => (index == 2 ? 3 : 1),
    #           'two' => (index == 2 ? 4 : 2),
    #         },
    #       })
    #     end
    #
    #     docker.provision
    #   end
    #
    #   it 'should create a container with capabilities added' do
    #     hosts.each_with_index do |host, index|
    #       host['docker_cap_add'] = ['NET_ADMIN', 'SYS_ADMIN']
    #
    #       expect( ::Lxc::Container ).to receive(:create).with({
    #         'Image' => image.id,
    #         'Hostname' => host.name,
    #         'HostConfig' => {
    #           'PortBindings' => {
    #             '22/tcp' => [{ 'HostPort' => /\b\d{4}\b/, 'HostIp' => '0.0.0.0'}]
    #           },
    #           'PublishAllPorts' => true,
    #           'Privileged' => true,
    #           'RestartPolicy' => {
    #             'Name' => 'always'
    #           },
    #           'CapAdd' => ['NET_ADMIN', 'SYS_ADMIN']
    #         },
    #         'Labels' => {
    #           'one' => (index == 2 ? 3 : 1),
    #           'two' => (index == 2 ? 4 : 2),
    #         },
    #       })
    #     end
    #
    #     docker.provision
    #   end
    #
    #   it 'should start the container' do
    #     expect( container ).to receive(:start)
    #
    #     docker.provision
    #   end
    #
    #   context "connecting to ssh" do
    #     before { @docker_host = ENV['DOCKER_HOST'] }
    #     after { ENV['DOCKER_HOST'] = @docker_host }
    #
    #     it 'should expose port 22 to beaker' do
    #       ENV['DOCKER_HOST'] = nil
    #       docker.provision
    #
    #       expect( hosts[0]['ip'] ).to be === '127.0.1.1'
    #       expect( hosts[0]['port'] ).to be ===  8022
    #     end
    #
    #     it 'should expose port 22 to beaker when using DOCKER_HOST' do
    #       ENV['DOCKER_HOST'] = "tcp://192.0.2.2:2375"
    #       docker.provision
    #
    #       expect( hosts[0]['ip'] ).to be === '192.0.2.2'
    #       expect( hosts[0]['port'] ).to be === 8022
    #     end
    #
    #     it 'should have ssh agent forwarding enabled' do
    #       ENV['DOCKER_HOST'] = nil
    #       docker.provision
    #
    #       expect( hosts[0]['ip'] ).to be === '127.0.1.1'
    #       expect( hosts[0]['port'] ).to be === 8022
    #       expect( hosts[0]['ssh'][:password] ).to be ===  'root'
    #       expect( hosts[0]['ssh'][:port] ).to be ===  8022
    #       expect( hosts[0]['ssh'][:forward_agent] ).to be === true
    #     end
    #
    #     it 'should connect to gateway ip' do
    #       FakeFS do
    #         File.open('/.dockerenv', 'w') { }
    #         docker.provision
    #
    #         expect( hosts[0]['ip'] ).to be === '192.0.2.254'
    #         expect( hosts[0]['port'] ).to be === 8022
    #       end
    #     end
    #
    #   end
    #
    #   it "should generate a new /etc/hosts file referencing each host" do
    #     ENV['DOCKER_HOST'] = nil
    #     docker.provision
    #     hosts.each do |host|
    #       expect( docker ).to receive( :get_domain_name ).with( host ).and_return( 'labs.lan' )
    #       expect( docker ).to receive( :set_etc_hosts ).with( host, "127.0.0.1\tlocalhost localhost.localdomain\n192.0.2.1\tvm1.labs.lan vm1\n192.0.2.1\tvm2.labs.lan vm2\n192.0.2.1\tvm3.labs.lan vm3\n" ).once
    #     end
    #     docker.hack_etc_hosts( hosts, options )
    #   end
    #
    #   it 'should record the image and container for later' do
    #     docker.provision
    #
    #     expect( hosts[0]['docker_image_id'] ).to be === image.id
    #     expect( hosts[0]['docker_container_id'] ).to be === container.id
    #   end
    #
    #   context 'provision=false' do
    #     let(:options) {{
    #       :logger => logger,
    #       :forward_ssh_agent => true,
    #       :provision => false
    #     }}
    #
    #
    #     it 'should fix ssh' do
    #       hosts.each_with_index do |host, index|
    #         container_name = "spec-container-#{index}"
    #         host['docker_container_name'] = container_name
    #
    #         expect( ::Lxc::Container ).to receive(:all).and_return([container])
    #         expect(docker).to receive(:fix_ssh).exactly(1).times
    #       end
    #       docker.provision
    #     end
    #
    #     it 'should not create a container if a named one already exists' do
    #       hosts.each_with_index do |host, index|
    #         container_name = "spec-container-#{index}"
    #         host['docker_container_name'] = container_name
    #
    #         expect( ::Lxc::Container ).to receive(:all).and_return([container])
    #         expect( ::Lxc::Container ).not_to receive(:create)
    #       end
    #
    #       docker.provision
    #     end
    #   end
    # end
    #
    # describe '#cleanup' do
    #   before :each do
    #     # get into a state where there's something to clean
    #     allow( ::Lxc ).to receive(:validate_version!)
    #     allow( ::Lxc::Container ).to receive(:all).and_return([container])
    #     allow( ::Lxc::Image ).to receive(:remove).with(image.id)
    #     allow( docker ).to receive(:dockerfile_for)
    #     docker.provision
    #   end
    #
    #   it 'should stop the containers' do
    #     allow( docker ).to receive( :sleep ).and_return(true)
    #     expect( container ).to receive(:kill)
    #     docker.cleanup
    #   end
    #
    #   it 'should delete the containers' do
    #     allow( docker ).to receive( :sleep ).and_return(true)
    #     expect( container ).to receive(:delete)
    #     docker.cleanup
    #   end
    #
    #   it 'should delete the images' do
    #     allow( docker ).to receive( :sleep ).and_return(true)
    #     expect( ::Lxc::Image ).to receive(:remove).with(image.id)
    #     docker.cleanup
    #   end
    #
    #   it 'should not delete the image if docker_preserve_image is set to true' do
    #     allow( docker ).to receive( :sleep ).and_return(true)
    #     hosts.each do |host|
    #       host['docker_preserve_image']=true
    #     end
    #     expect( ::Lxc::Image ).to_not receive(:remove)
    #     docker.cleanup
    #   end
    #
    #   it 'should delete the image if docker_preserve_image is set to false' do
    #     allow( docker ).to receive( :sleep ).and_return(true)
    #     hosts.each do |host|
    #       host['docker_preserve_image']=false
    #     end
    #     expect( ::Lxc::Image ).to receive(:remove).with(image.id)
    #     docker.cleanup
    #   end
    #
    # end
    #
    # describe '#dockerfile_for' do
    #   FakeFS.deactivate!
    #   before :each do
    #     allow( ::Lxc ).to receive(:validate_version!)
    #   end
    #   it 'should raise on an unsupported platform' do
    #     expect { docker.send(:dockerfile_for, {'platform' => 'a_sidewalk', 'image' => 'foobar' }) }.to raise_error(/platform a_sidewalk not yet supported/)
    #   end
    #
    #   it 'should set "ENV container docker"' do
    #     FakeFS.deactivate!
    #     platforms.each do |platform|
    #       dockerfile = docker.send(:dockerfile_for, {
    #         'platform' => platform,
    #         'image' => 'foobar',
    #       })
    #       expect( dockerfile ).to be =~ /ENV container docker/
    #     end
    #   end
    #
    #   it 'should add docker_image_commands as RUN statements' do
    #     FakeFS.deactivate!
    #     platforms.each do |platform|
    #       dockerfile = docker.send(:dockerfile_for, {
    #         'platform' => platform,
    #         'image' => 'foobar',
    #         'docker_image_commands' => [
    #           'special one',
    #           'special two',
    #           'special three',
    #         ]
    #       })
    #
    #       expect( dockerfile ).to be =~ /RUN special one\nRUN special two\nRUN special three/
    #     end
    #   end
    #
    #   it 'should add docker_image_entrypoint' do
    #     FakeFS.deactivate!
    #     platforms.each do |platform|
    #       dockerfile = docker.send(:dockerfile_for, {
    #         'platform' => platform,
    #         'image' => 'foobar',
    #         'docker_image_entrypoint' => '/bin/bash'
    #       })
    #
    #       expect( dockerfile ).to be =~ %r{ENTRYPOINT /bin/bash}
    #     end
    #   end
    #
    #   it 'should use zypper on sles' do
    #     FakeFS.deactivate!
    #     dockerfile = docker.send(:dockerfile_for, {
    #       'platform' => 'sles-12-x86_64',
    #       'image' => 'foobar',
    #     })
    #
    #     expect( dockerfile ).to be =~ /RUN zypper -n in openssh/
    #   end
    #
    #   (22..29).to_a.each do | fedora_release |
    #     it "should use dnf on fedora #{fedora_release}" do
    #       FakeFS.deactivate!
    #       dockerfile = docker.send(:dockerfile_for, {
    #         'platform' => "fedora-#{fedora_release}-x86_64",
    #         'image' => 'foobar',
    #       })
    #
    #       expect( dockerfile ).to be =~ /RUN dnf install -y sudo/
    #     end
    #   end
    #
    #   it 'should use pacman on archlinux' do
    #     FakeFS.deactivate!
    #     dockerfile = docker.send(:dockerfile_for, {
    #       'platform' => 'archlinux-current-x86_64',
    #       'image' => 'foobar',
    #     })
    #
    #     expect( dockerfile ).to be =~ /RUN pacman -S --noconfirm openssh/
    #   end
    # end
  end
end
