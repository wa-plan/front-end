import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';

function CreateScreen1(){
    return(
        <View style={{flex:1, alignItems:"center", marginTop:30, backgroundColor:"#262626"}}>

        <View style={{width:"90%", height:"10%", justifyContent:"center"}}>
          <Text style={{color:"white", fontSize:29, fontWeight:"bold"}}>플랜 만들기</Text>
        </View>
  
        <View style={{width:"90%", height:"10%", justifyContent:"center"}}>
          <Text style={{color:"white", fontSize:16, fontWeight:"bold"}}>목표를 이루기 위한</Text>
          <Text style={{color:"white", fontSize:16, fontWeight:"bold"}}>작은 계획들을 세워봐요</Text>
        </View>
  
        <View style={{width:"90%", height:"6%", backgroundColor:"#FCFF62", justifyContent:"center", borderRadius:6}}>
          <Text style={{fontWeight:"bold", padding:10}}>환상적인 세계여행</Text>
        </View>
  
  
        <View style={{width:"90%", height:"50%", flexWrap:"wrap", justifyContent:"space-between", padding:30, paddingTop:50, alignContent:"space-between"}}>
        
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#929292"}}></TextInput>
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#929292"}}></TextInput>
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#929292"}}></TextInput>
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#929292"}}></TextInput>
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#FCFF62"}}></TextInput>
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#929292"}}></TextInput>
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#929292"}}></TextInput>
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#929292"}}></TextInput>
           <TextInput style={{width:"30%", height:"30%", backgroundColor:"#929292"}}></TextInput>
      
        </View>
  
        <View style={{width:"90%", height:"13%", alignItems:"center", justifyContent:"center"}}>
          <Text style={{color:"#5C5C5C", fontWeight:"bold"}}>모든 칸을 다 채우지 않아도 괜찮아요:)</Text>
        </View>
  
        <View style={{width:"90%", height:"10%", flexDirection:"row", justifyContent:"space-between", alignItems:"center"}}>
          <TouchableOpacity style={{backgroundColor:"black", borderRadius:6}}>
            <Text style={{color:"white", paddingHorizontal:20, paddingVertical:10, fontWeight:"bold"}}>이전</Text>
          </TouchableOpacity>
  
          <TouchableOpacity style={{backgroundColor:"black", borderRadius:6}}>
            <Text style={{color:"white", paddingHorizontal:20, paddingVertical:10, fontWeight:"bold"}}>저장</Text>
          </TouchableOpacity>
        </View>
  
      </View>
    );
}

export default CreateScreen1;