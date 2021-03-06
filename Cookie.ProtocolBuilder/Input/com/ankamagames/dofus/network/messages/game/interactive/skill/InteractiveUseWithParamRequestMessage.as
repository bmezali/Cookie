package com.ankamagames.dofus.network.messages.game.interactive.skill
{
   import com.ankamagames.dofus.network.messages.game.interactive.InteractiveUseRequestMessage;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class InteractiveUseWithParamRequestMessage extends InteractiveUseRequestMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6715;
       
      
      private var _isInitialized:Boolean = false;
      
      public var id:int = 0;
      
      public function InteractiveUseWithParamRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6715;
      }
      
      public function initInteractiveUseWithParamRequestMessage(param1:uint = 0, param2:uint = 0, param3:int = 0) : InteractiveUseWithParamRequestMessage
      {
         super.initInteractiveUseRequestMessage(param1,param2);
         this.id = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.id = 0;
         this._isInitialized = false;
      }
      
      override public function pack(param1:ICustomDataOutput) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(new CustomDataWrapper(_loc2_));
         if(HASH_FUNCTION != null)
         {
            HASH_FUNCTION(_loc2_);
         }
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:ICustomDataInput, param2:uint) : void
      {
         this.deserialize(param1);
      }
      
      override public function unpackAsync(param1:ICustomDataInput, param2:uint) : FuncTree
      {
         var _loc3_:FuncTree = new FuncTree();
         _loc3_.setRoot(param1);
         this.deserializeAsync(_loc3_);
         return _loc3_;
      }
      
      override public function serialize(param1:ICustomDataOutput) : void
      {
         this.serializeAs_InteractiveUseWithParamRequestMessage(param1);
      }
      
      public function serializeAs_InteractiveUseWithParamRequestMessage(param1:ICustomDataOutput) : void
      {
         super.serializeAs_InteractiveUseRequestMessage(param1);
         param1.writeInt(this.id);
      }
      
      override public function deserialize(param1:ICustomDataInput) : void
      {
         this.deserializeAs_InteractiveUseWithParamRequestMessage(param1);
      }
      
      public function deserializeAs_InteractiveUseWithParamRequestMessage(param1:ICustomDataInput) : void
      {
         super.deserialize(param1);
         this._idFunc(param1);
      }
      
      override public function deserializeAsync(param1:FuncTree) : void
      {
         this.deserializeAsyncAs_InteractiveUseWithParamRequestMessage(param1);
      }
      
      public function deserializeAsyncAs_InteractiveUseWithParamRequestMessage(param1:FuncTree) : void
      {
         super.deserializeAsync(param1);
         param1.addChild(this._idFunc);
      }
      
      private function _idFunc(param1:ICustomDataInput) : void
      {
         this.id = param1.readInt();
      }
   }
}
