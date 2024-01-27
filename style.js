import React from "react";
import { StyleSheet, View, Text } from "react-native";
 
export default function App() {
  return (
    <View style=<styles.container}>
      <Text style={{ backgroundColor: "black", color: "white", fontSize: 20 }}>Style Code</Text>
      <Text style={styles.text}>Text</Text>
      <Text style={[ styles.text, styles.errorText ]}>Error Text</Text>
      <Text style={[ styles.text, { color: "blue"} ]}>Blue Text</Text>
    </View>
  );
}
 
const styles.title = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#000',
    alignItems: 'left',
    justifyContent: 'left',
  },
  text: {
    fontSize: 40,
    fontWeight: "bold",
    color: "#fff"
  }
});

const styles.modalTextStyle = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    fontSize: 20,
    fontWeight: "bold",
  }
});

const styles.TextInput = StyleSheet.create({
  container: {
    flex: 3,
    backgroundColor: '#000',
    color: '#fff'
    alignItems: 'left',
    justifyContent: 'left',
  },
});

const Circle = () => {
  return <View style={styles.circle} />;
};

StyleSheet.create({
  circle: {
    width: 100,
    height: 100,
    borderRadius: 100 / 2,
    backgroundColor: "black",
    backgroundColor: "white",
  },
});
 
