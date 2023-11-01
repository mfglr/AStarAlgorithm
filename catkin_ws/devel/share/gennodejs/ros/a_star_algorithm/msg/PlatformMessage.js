// Auto-generated. Do not edit!

// (in-package a_star_algorithm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

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
        this.start = [];
      }
      if (initObj.hasOwnProperty('end')) {
        this.end = initObj.end
      }
      else {
        this.end = [];
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
    bufferOffset = _arraySerializer.int32(obj.start, buffer, bufferOffset, null);
    // Serialize message field [end]
    bufferOffset = _arraySerializer.int32(obj.end, buffer, bufferOffset, null);
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
    data.start = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [end]
    data.end = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [data]
    data.data = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.start.length;
    length += 4 * object.end.length;
    length += 4 * object.data.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/PlatformMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a16b117448f2a137e2d0ba8d172a1948';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    int32 size
    int32[] start
    int32[] end
    int32[] data
    
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
      resolved.start = msg.start;
    }
    else {
      resolved.start = []
    }

    if (msg.end !== undefined) {
      resolved.end = msg.end;
    }
    else {
      resolved.end = []
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
