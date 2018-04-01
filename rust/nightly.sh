#!/usr/bin/env bash


curl https://sh.rustup.rs -sSf | sh -s -- -y

rustup install nightly
rustup default nightly

cargo install rustfmt

# rust language server
rustup component add rls-preview rust-analysis rust-src