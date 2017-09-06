# Cookbook Name:: varnish
# Recipe:: repo
#
# Copyright 2014. Patrick Connolly <patrick@myplanetdigital.com>
# Copyright 2015. Rackspace, US Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Packagecloud repos omit dot from major version
major_version_no_dot = node['varnish']['version'].to_s.tr('.', '')

case node['platform_family']
when 'debian'
  packagecloud_repo "varnishcache/varnish#{major_version_no_dot}" do
    type "deb"
  end
when 'rhel', 'fedora'
  packagecloud_repo "varnishcache/varnish#{major_version_no_dot}" do
    type "rpm"
  end
end
