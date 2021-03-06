#! /usr/bin/env bash

ARDUINO_HOME="${HOME}/Projects/Arduino"

echo "Making sure java8 and ant are installed..."
brew tap caskroom/cask
brew tap caskroom/versions

echo "Install java8"
brew cask install java8

echo "Install ant"
brew install ant


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

echo "ant clean"
ant clean


echo "ant dist"
# I pipe in a newline as the easiest way to accept building latest:
# > dist:
# >     [input] Enter version number: [1.8.6]
ant dist << EOF

EOF

rm -rf $HOME/Applications/Arduino.app
cp -r macosx/work/Arduino.app $HOME/Applications/Arduino.app

# No driver needed, you just have to use a good cable. Crazy.

popd
