'use strict';

// 1
import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  Button,
  View
} from 'react-native';
import TestConnectNative from './TestConnectNative';

// 2
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: "#eaeaea"
  },
  welcome: {
    fontSize: 20,
    margin:50,
    color: "#20232a",
  },
});

// 3
class RNTestApp extends React.Component {

  sendMessageToNative = (message) => {
    TestConnectNative.sendMessage(message);
  };

  render() {
    return (
      <View style={styles.container}>

        <Text style={styles.welcome}>We're live from React Native!!!</Text>

        <Button
          title="Go to Top-up"
          onPress={() => this.sendMessageToNative("TOPUP")}
        />

        <Button
          title="Go to History"
          onPress={() => this.sendMessageToNative("HISTORY")}
        />

      </View>
    )
  }

}

// 4
AppRegistry.registerComponent('RNTestApp', () => RNTestApp);