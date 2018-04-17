#! /usr/bin/env bash

ARDUINO_HOME="${HOME}/Projects/Arduino"

brew tap caskroom/cask
brew tap caskroom/versions
brew cask install java8 ant

if [ ! -e "${ARDUINO_HOME}" ]; then
  echo "Cloning Arduino into ${ARDUINO_HOME}"
  git clone --depth 1 https://github.com/arduino/Arduino.git ${ARDUINO_HOME}
else
  echo "Updating Arduino in ${ARDUINO_HOME}"
  pushd ${ARDUINO_HOME}
  git pull
  popd
fi

pushd ${ARDUINO_HOME}/build

ant clean build
ant dist

popd
