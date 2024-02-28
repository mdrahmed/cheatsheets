## Fuzzing tutorials
[Tutorials by afl++](https://github.com/AFLplusplus/AFLplusplus/blob/stable/docs/tutorials.md)

## Training
[afl-training](https://github.com/mykter/afl-training)
[fuzzing101](https://github.com/antonio-morales/Fuzzing101)
[Ekoparty](https://github.com/antonio-morales/EkoParty_Advanced_Fuzzing_Workshop)

## Hands-on practice
[Use winafl to fuzz windows binaries](https://github.com/googleprojectzero/winafl?tab=readme-ov-file#known-cves)
[Find programs from adobe, msrc](https://www.microsoft.com/en-us/msrc/bounty)

[Set a new project with OSS-fuzzer](https://google.github.io/oss-fuzz/getting-started/new-project-guide/)
[See Integration](https://google.github.io/oss-fuzz/getting-started/integration-rewards/)
[Google git](https://chromium.googlesource.com/)

## Look for softwares to fuzz
[oss-fuzz chromium](https://bugs.chromium.org/p/oss-fuzz/issues/list?q=&can=1)

## Custom mutator ideas
Mutator is generating valid inputs and feeding it to `afl-fuzz`. Write a mutator that will provide valid inputs to the functions.
[Custom-mutator](https://aflplus.plus/docs/custom_mutators/)
[example.c mutator](https://github.com/AFLplusplus/AFLplusplus/blob/stable/custom_mutators/examples/example.c#L51)
[Grammer-mutator](https://github.com/AFLplusplus/Grammar-Mutator)
[fuzzbook mutatorfuzzer](https://www.fuzzingbook.org/beta/html/MutationFuzzer.html)

#### Fuzz rust programs
[Fuzz rust programs](https://rust-fuzz.github.io/book/introduction.html)

##### Rust installation
[Install rust-lang](https://www.rust-lang.org/learn/get-started),
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
Now, rust is installed, open a new terminal and play with rust programs.

#### Using `cargo-fuzz` 

##### MOST IMPORTANTLY Install the right compiler,
```
$ rustup default
stable-x86_64-unknown-linux-gnu (default) # Not the compiler we want.

# need nightly
$ rustup install nightly
$ rustup default nightly
nightly-x86_64-unknown-linux-gnu (default) # The correct compiler.
```

Install cargo,
```
cargo install cargo-fuzz

#upgrading,
cargo install --force cargo-fuzz
```

Now, check this [tutorial to fuzz rust-url.](https://rust-fuzz.github.io/book/cargo-fuzz/tutorial.html)
```
git clone https://github.com/servo/rust-url.git
cd rust-url

git checkout bfa167b4e0253642b6766a7aa74a99df60a94048

cargo fuzz init

cargo fuzz list # use these as target names
```

Now, update the target source code,
```
#![no_main]
#[macro_use] extern crate libfuzzer_sys;
extern crate url;

fuzz_target!(|data: &[u8]| {
    if let Ok(s) = std::str::from_utf8(data) {
        let _ = url::Url::parse(s);
    }
});
```


Now, run the fuzzer,
```
cargo fuzz run fuzz_target_1
```

#### Using `afl.rs`
Install it with following,
```
cargo install cargo-afl

# upgrade
cargo install --force cargo-afl
```

Now, fuzz the `rust-url`,
```
git clone https://github.com/servo/rust-url.git
cd rust-url

cargo new --bin url-fuzz-target
cd url-fuzz-target
```
Add these to the Cargo.toml file,
```
[dependencies]
afl = "*"
url = "*"
```

Now we’ll need to write the source for the fuzz target in `src/main.rs`:
```
#[macro_use]
extern crate afl;
extern crate url;

fn main() {
    fuzz!(|data: &[u8]| {
        if let Ok(s) = std::str::from_utf8(data) {
            let _ = url::Url::parse(&s);
        }
    });
}
```

##### Build the fuzz target,
```
cargo afl build
```

##### Provide starter inputs
Create inputs,
```
mkdir in
echo "tcp://example.com/" > in/url
echo "ssh://192.168.1.1" > in/url2
echo "http://www.example.com:80/foo?hi=bar" > in/url3
```

#### Start Fuzzing
To begin fuzzing, run this,
```
cargo afl fuzz -i in -o out target/debug/url-fuzz-target
```

If getting errors like following,
```
    SL=/System/Library; PL=com.apple.ReportCrash
    launchctl unload -w ${SL}/LaunchAgents/${PL}.plist
    sudo launchctl unload -w ${SL}/LaunchDaemons/${PL}.Root.plist

[-] PROGRAM ABORT : Crash reporter detected
         Location : check_crash_handling(), src/afl-fuzz-init.c:2347
```

Then run following command,
```
cargo-afl afl system-config
```
