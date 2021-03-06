package com.ankamagames.dofus.network.types.game.friend
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class AbstractContactInformations implements INetworkType
   {
      
      public static const protocolId:uint = 380;
       
      
      public var accountId:uint = 0;
      
      public var accountName:String = "";
      
      public function AbstractContactInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 380;
      }
      
      public function initAbstractContactInformations(param1:uint = 0, param2:String = "") : AbstractContactInformations
      {
         this.accountId = param1;
         this.accountName = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.accountId = 0;
         this.accountName = "";
      }
      
      public function serialize(param1:ICustomDataOutput) : void
      {
         this.serializeAs_AbstractContactInformations(param1);
      }
      
      public function serializeAs_AbstractContactInformations(param1:ICustomDataOutput) : void
      {
         if(this.accountId < 0)
         {
            throw new Error("Forbidden value (" + this.accountId + ") on element accountId.");
         }
         param1.writeInt(this.accountId);
         param1.writeUTF(this.accountName);
      }
      
      public function deserialize(param1:ICustomDataInput) : void
      {
         this.deserializeAs_AbstractContactInformations(param1);
      }
      
      public function deserializeAs_AbstractContactInformations(param1:ICustomDataInput) : void
      {
         this._accountIdFunc(param1);
         this._accountNameFunc(param1);
      }
      
      public function deserializeAsync(param1:FuncTree) : void
      {
         this.deserializeAsyncAs_AbstractContactInformations(param1);
      }
      
      public function deserializeAsyncAs_AbstractContactInformations(param1:FuncTree) : void
      {
         param1.addChild(this._accountIdFunc);
         param1.addChild(this._accountNameFunc);
      }
      
      private function _accountIdFunc(param1:ICustomDataInput) : void
      {
         this.accountId = param1.readInt();
         if(this.accountId < 0)
         {
            throw new Error("Forbidden value (" + this.accountId + ") on element of AbstractContactInformations.accountId.");
         }
      }
      
      private function _accountNameFunc(param1:ICustomDataInput) : void
      {
         this.accountName = param1.readUTF();
      }
   }
}
