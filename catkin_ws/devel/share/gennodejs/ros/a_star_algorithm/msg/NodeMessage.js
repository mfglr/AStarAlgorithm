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

class NodeMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.location = null;
      this.g = null;
    }
    else {
      if (initObj.hasOwnProperty('location')) {
        this.location = initObj.location
      }
      else {
        this.location = new VectorMessage();
      }
      if (initObj.hasOwnProperty('g')) {
        this.g = initObj.g
      }
      else {
        this.g = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NodeMessage
    // Serialize message field [location]
    bufferOffset = VectorMessage.serialize(obj.location, buffer, bufferOffset);
    // Serialize message field [g]
    bufferOffset = _serializer.int32(obj.g, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NodeMessage
    let len;
    let data = new NodeMessage(null);
    // Deserialize message field [location]
    data.location = VectorMessage.deserialize(buffer, bufferOffset);
    // Deserialize message field [g]
    data.g = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/NodeMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '055d2c8f3fa27ed8eee4293f534be47c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    VectorMessage location
    int32 g
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
    const resolved = new NodeMessage(null);
    if (msg.location !== undefined) {
      resolved.location = VectorMessage.Resolve(msg.location)
    }
    else {
      resolved.location = new VectorMessage()
    }

    if (msg.g !== undefined) {
      resolved.g = msg.g;
    }
    else {
      resolved.g = 0
    }

    return resolved;
    }
};

module.exports = NodeMessage;
