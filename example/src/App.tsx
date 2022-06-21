import * as React from 'react';

import { StyleSheet, View, Text, Alert } from 'react-native';
import { multiply, getTimeZone } from 'react-native-tz';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    //  multiply(3, 7).then(setResult);
    async function init(){
      var timeZone = await getTimeZone();
     Alert.alert(timeZone);
    }
    init();
  }, []);


  React.useEffect(() => {

  }, []);

  return (
    <View style={styles.container}>
      {/* <Text>Result: {result}</Text> */}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
