// Auto-generated. Do not edit!

// (in-package a_star_algorithm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let NodeMessage = require('./NodeMessage.js');

//-----------------------------------------------------------

class PathMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.sizeOfNodes = null;
      this.nodes = null;
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
      if (initObj.hasOwnProperty('nodes')) {
        this.nodes = initObj.nodes
      }
      else {
        this.nodes = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PathMessage
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [sizeOfNodes]
    bufferOffset = _serializer.int32(obj.sizeOfNodes, buffer, bufferOffset);
    // Serialize message field [nodes]
    // Serialize the length for message field [nodes]
    bufferOffset = _serializer.uint32(obj.nodes.length, buffer, bufferOffset);
    obj.nodes.forEach((val) => {
      bufferOffset = NodeMessage.serialize(val, buffer, bufferOffset);
    });
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
    // Deserialize message field [nodes]
    // Deserialize array length for message field [nodes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.nodes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.nodes[i] = NodeMessage.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 12 * object.nodes.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a_star_algorithm/PathMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '811bbae5e142336076d4597212609193';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    int32 sizeOfNodes
    NodeMessage[] nodes
    ================================================================================
    MSG: a_star_algorithm/NodeMessage
    VectorMessage location
    int32 value
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

    if (msg.nodes !== undefined) {
      resolved.nodes = new Array(msg.nodes.length);
      for (let i = 0; i < resolved.nodes.length; ++i) {
        resolved.nodes[i] = NodeMessage.Resolve(msg.nodes[i]);
      }
    }
    else {
      resolved.nodes = []
    }

    return resolved;
    }
};

module.exports = PathMessage;
