// Auto-generated. Do not edit!

// (in-package counter_node.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class counterRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.req_id = null;
    }
    else {
      if (initObj.hasOwnProperty('req_id')) {
        this.req_id = initObj.req_id
      }
      else {
        this.req_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type counterRequest
    // Serialize message field [req_id]
    bufferOffset = _serializer.int16(obj.req_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type counterRequest
    let len;
    let data = new counterRequest(null);
    // Deserialize message field [req_id]
    data.req_id = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'counter_node/counterRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd67e2fcd47f3255cc3fbcfba8a121186';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 req_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new counterRequest(null);
    if (msg.req_id !== undefined) {
      resolved.req_id = msg.req_id;
    }
    else {
      resolved.req_id = 0
    }

    return resolved;
    }
};

class counterResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reply = null;
    }
    else {
      if (initObj.hasOwnProperty('reply')) {
        this.reply = initObj.reply
      }
      else {
        this.reply = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type counterResponse
    // Serialize message field [reply]
    bufferOffset = _serializer.float32(obj.reply, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type counterResponse
    let len;
    let data = new counterResponse(null);
    // Deserialize message field [reply]
    data.reply = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'counter_node/counterResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '040d3b0e975a8d9d7be9e89146cbb7a9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 reply
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new counterResponse(null);
    if (msg.reply !== undefined) {
      resolved.reply = msg.reply;
    }
    else {
      resolved.reply = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: counterRequest,
  Response: counterResponse,
  md5sum() { return '4280a7cf1d34a23e38e36c574443dc71'; },
  datatype() { return 'counter_node/counter'; }
};
