# dnsseed

checks your coin's dnsseed response node count

# installation

get ruby, then:

```
git clone https://github.com/linki/dnsseed.git
cd dnsseed
bundle install
```

# usage

```
./dnsseed.rb dnsseed.bluematt.me
=> 21 active nodes
```

it prints the number of IPs returned by your dnsseed node. pass it a threshold
and check the exit code to make sure your dnsseed node still works, e.g. for
use in a ci server.

```
./dnsseed.rb dnsseed.bluematt.me 20
=> 21 active nodes
echo $?
=> 0
./dnsseed.rb dnsseed.bluematt.me 22
=> 21 active nodes
echo $?
=> 1
```

works for other coins as well:

```
./dnsseed.rb dnsseed.earthcointools.org
=> 12 active nodes
```

don't have ruby? use docker:

```
docker run quay.io/linki/dnsseed dnsseed.earthcointools.org
=> 12 active nodes
```
