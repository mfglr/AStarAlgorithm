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

class GridMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.size = null;
      this.grid = null;
    }
    else {
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = 0;
      }
      if (initObj.hasOwnProperty('grid')) {
        this.grid = initObj.grid
      }
      else {
        this.grid = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GridMessage
    // Serialize message field [size]
    bufferOffset = _serializer.int32(obj.size, buffer, bufferOffset);
    // Serialize message field [grid]
    bufferOffset = _arraySerializer.int32(obj.grid, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GridMessage
    let len;
    let data = new GridMessage(null);
    // Deserialize message field [size]
    data.size = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [grid]
    data.grid = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.grid.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/GridMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c0a5d0669a4de9c73b3b64e22ac14b51';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 size
    int32[] grid
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GridMessage(null);
    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = 0
    }

    if (msg.grid !== undefined) {
      resolved.grid = msg.grid;
    }
    else {
      resolved.grid = []
    }

    return resolved;
    }
};

module.exports = GridMessage;
