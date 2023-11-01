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

class pathMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.sizeOfPath = null;
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('sizeOfPath')) {
        this.sizeOfPath = initObj.sizeOfPath
      }
      else {
        this.sizeOfPath = 0;
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type pathMessage
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [sizeOfPath]
    bufferOffset = _serializer.int8(obj.sizeOfPath, buffer, bufferOffset);
    // Serialize message field [path]
    bufferOffset = _arraySerializer.int8(obj.path, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type pathMessage
    let len;
    let data = new pathMessage(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sizeOfPath]
    data.sizeOfPath = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [path]
    data.path = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.path.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/pathMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd11fa3ccd9cda428b05f117412d7ba8b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    int8 sizeOfPath
    int8[] path
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new pathMessage(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.sizeOfPath !== undefined) {
      resolved.sizeOfPath = msg.sizeOfPath;
    }
    else {
      resolved.sizeOfPath = 0
    }

    if (msg.path !== undefined) {
      resolved.path = msg.path;
    }
    else {
      resolved.path = []
    }

    return resolved;
    }
};

module.exports = pathMessage;
