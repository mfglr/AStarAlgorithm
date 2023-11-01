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

class PathMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.sizeOfNodes = null;
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('sizeOfNodes')) {
        this.sizeOfNodes = initObj.sizeOfNodes
      }
      else {
        this.sizeOfNodes = 0;
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
    // Serializes a message object of type PathMessage
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [sizeOfNodes]
    bufferOffset = _serializer.int32(obj.sizeOfNodes, buffer, bufferOffset);
    // Serialize message field [path]
    bufferOffset = _arraySerializer.int32(obj.path, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PathMessage
    let len;
    let data = new PathMessage(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sizeOfNodes]
    data.sizeOfNodes = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [path]
    data.path = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.path.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/PathMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '126cd8f525eab64ba326556281e7f16a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    int32 sizeOfNodes
    int32[] path
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PathMessage(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.sizeOfNodes !== undefined) {
      resolved.sizeOfNodes = msg.sizeOfNodes;
    }
    else {
      resolved.sizeOfNodes = 0
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

module.exports = PathMessage;
