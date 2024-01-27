import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Image, TextInput, ScrollView, Button, Switch } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>프로필 편집하기</Text>
      <Text style={styles.text}>사진으로 자신을 표현해봐요.</Text>
      
      <StatusBar style="auto" />
      
  
      <Text style={styles.text}>닉네임을 만들어봐요.</Text>
      <TextInput placeholder="ex) 일탈을 원하는 마이크" />

      <Text style={styles.text}>닉네임을 만들어봐요.</Text>
      <TextInput placeholder="ex) 세상이 궁금한 소심하고 당당한 마이크" />
      
      <Button title="취소" onPress={()=>{console.log("clicked");}}/>
      <Button title="취소" onPress={()=>{console.log("clicked");}}/>

      <Switch value={true} />
      
    </View>
  );
}

return (
    <View style={styles.container}>
        <View style={styles.viewContainer}>
            <Text style={styles.textStyle}>어디서 사진을 가져올까요?</Text>
            <Pressable onPress={onPressModalOpen}>
                <Text style={styles.textStyle}>카메라로 찍기</Text>
                <Text style={styles.textStyle}>내 갤러리</Text>
                <Text style={styles.textStyle}>기본 이미지</Text>
            </Pressable>
        </View>

        <View style={{ marginTop: 400 }}>
            <Modal
                animationType="slide"
                visible={isModalVisible}
                transparent={true}
            >
                <View style={styles.modalView}>
                    <View>
                        <Text style={styles.modalTextStyle}>어디서 사진을 가져올까요</Text>
                    </View>
                    <Pressable
                        onPress={onPressModalClose}>
                        <Text>Modal Close!</Text>
                    </Pressable>
                </View>
            </Modal>
        </View>
    </View>

)
