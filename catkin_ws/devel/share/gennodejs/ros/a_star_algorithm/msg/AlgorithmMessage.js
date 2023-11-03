// Auto-generated. Do not edit!

// (in-package a_star_algorithm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PlatformMessage = require('./PlatformMessage.js');
let PathMessage = require('./PathMessage.js');

//-----------------------------------------------------------

class AlgorithmMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.platform = null;
      this.activePath = null;
      this.paths = null;
    }
    else {
      if (initObj.hasOwnProperty('platform')) {
        this.platform = initObj.platform
      }
      else {
        this.platform = new PlatformMessage();
      }
      if (initObj.hasOwnProperty('activePath')) {
        this.activePath = initObj.activePath
      }
      else {
        this.activePath = new PathMessage();
      }
      if (initObj.hasOwnProperty('paths')) {
        this.paths = initObj.paths
      }
      else {
        this.paths = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AlgorithmMessage
    // Serialize message field [platform]
    bufferOffset = PlatformMessage.serialize(obj.platform, buffer, bufferOffset);
    // Serialize message field [activePath]
    bufferOffset = PathMessage.serialize(obj.activePath, buffer, bufferOffset);
    // Serialize message field [paths]
    // Serialize the length for message field [paths]
    bufferOffset = _serializer.uint32(obj.paths.length, buffer, bufferOffset);
    obj.paths.forEach((val) => {
      bufferOffset = PathMessage.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AlgorithmMessage
    let len;
    let data = new AlgorithmMessage(null);
    // Deserialize message field [platform]
    data.platform = PlatformMessage.deserialize(buffer, bufferOffset);
    // Deserialize message field [activePath]
    data.activePath = PathMessage.deserialize(buffer, bufferOffset);
    // Deserialize message field [paths]
    // Deserialize array length for message field [paths]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.paths = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.paths[i] = PathMessage.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += PlatformMessage.getMessageSize(object.platform);
    length += PathMessage.getMessageSize(object.activePath);
    object.paths.forEach((val) => {
      length += PathMessage.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/AlgorithmMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '63a360c1d5e98eca0dd6fb4c67c4258a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    PlatformMessage platform
    PathMessage activePath
    PathMessage[] paths
    ================================================================================
    MSG: a_star_algorithm/PlatformMessage
    int32 id
    int32 size
    VectorMessage start
    VectorMessage end
    int32[] data
    
    ================================================================================
    MSG: a_star_algorithm/VectorMessage
    int32 x
    int32 y
    ================================================================================
    MSG: a_star_algorithm/PathMessage
    int32 id
    int32 sizeOfNodes
    NodeMessage[] nodes
    ================================================================================
    MSG: a_star_algorithm/NodeMessage
    VectorMessage location
    int32 value
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AlgorithmMessage(null);
    if (msg.platform !== undefined) {
      resolved.platform = PlatformMessage.Resolve(msg.platform)
    }
    else {
      resolved.platform = new PlatformMessage()
    }

    if (msg.activePath !== undefined) {
      resolved.activePath = PathMessage.Resolve(msg.activePath)
    }
    else {
      resolved.activePath = new PathMessage()
    }

    if (msg.paths !== undefined) {
      resolved.paths = new Array(msg.paths.length);
      for (let i = 0; i < resolved.paths.length; ++i) {
        resolved.paths[i] = PathMessage.Resolve(msg.paths[i]);
      }
    }
    else {
      resolved.paths = []
    }

    return resolved;
    }
};

module.exports = AlgorithmMessage;
