import React from 'react';
import { View, Text, TouchableOpacity} from 'react-native';

function MainScreen({navigation}) {
    return(
        <View>

      <View>
        <Text>도미노 플랜</Text>
      </View>

      <View>
        <TouchableOpacity>
          <Text>플러스 아이콘</Text>
        </TouchableOpacity>
      </View>

      <View>
        <Text>만다라트 목록</Text>
      </View>

    </View>
    );
}

export default MainScreen;