// Auto-generated. Do not edit!

// (in-package a_star_algorithm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let VectorMessage = require('./VectorMessage.js');

//-----------------------------------------------------------

class PlatformMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.size = null;
      this.start = null;
      this.end = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = 0;
      }
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = new VectorMessage();
      }
      if (initObj.hasOwnProperty('end')) {
        this.end = initObj.end
      }
      else {
        this.end = new VectorMessage();
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlatformMessage
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = _serializer.int32(obj.size, buffer, bufferOffset);
    // Serialize message field [start]
    bufferOffset = VectorMessage.serialize(obj.start, buffer, bufferOffset);
    // Serialize message field [end]
    bufferOffset = VectorMessage.serialize(obj.end, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.int32(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlatformMessage
    let len;
    let data = new PlatformMessage(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [start]
    data.start = VectorMessage.deserialize(buffer, bufferOffset);
    // Deserialize message field [end]
    data.end = VectorMessage.deserialize(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.data.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/PlatformMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a9b6046552f5181f0b68fa4d8d8c533d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    int32 size
    VectorMessage start
    VectorMessage end
    int32[] data
    
    ================================================================================
    MSG: a_star_algorithm/VectorMessage
    int32 x
    int32 y
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlatformMessage(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = 0
    }

    if (msg.start !== undefined) {
      resolved.start = VectorMessage.Resolve(msg.start)
    }
    else {
      resolved.start = new VectorMessage()
    }

    if (msg.end !== undefined) {
      resolved.end = VectorMessage.Resolve(msg.end)
    }
    else {
      resolved.end = new VectorMessage()
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = PlatformMessage;
