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

class platformMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.size = null;
      this.data = null;
      this.start = null;
      this.end = null;
    }
    else {
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type platformMessage
    // Serialize message field [size]
    bufferOffset = _serializer.int8(obj.size, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.int8(obj.data, buffer, bufferOffset, null);
    // Serialize message field [start]
    bufferOffset = _arraySerializer.int8(obj.start, buffer, bufferOffset, null);
    // Serialize message field [end]
    bufferOffset = _arraySerializer.int8(obj.end, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type platformMessage
    let len;
    let data = new platformMessage(null);
    // Deserialize message field [size]
    data.size = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.int8(buffer, bufferOffset, null)
    // Deserialize message field [start]
    data.start = _arrayDeserializer.int8(buffer, bufferOffset, null)
    // Deserialize message field [end]
    data.end = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.data.length;
    length += object.start.length;
    length += object.end.length;
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/platformMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6bc147b333d921576cde564f05a07c0b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 size
    int8[] data
    int8[] start
    int8[] end
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new platformMessage(null);
    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = 0
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
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

    return resolved;
    }
};

module.exports = platformMessage;
