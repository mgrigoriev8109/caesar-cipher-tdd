#spec/caesar_cipher_spec.rb
require "./lib/caesar_cipher.rb"

describe CaesarCipher do

  describe "#caesar_cipher" do
    it "Runs caesar cipher on one lower case letter" do
      caesar = CaesarCipher.new
      expect(caesar.caesar_cipher("w", 5)).to eql("r")
    end
  end
  describe "#caesar_cipher" do
    it "Runs caesar cipher on full lowercase sentence" do
      caesar = CaesarCipher.new
      expect(caesar.caesar_cipher("what is", 5)).to eql("rcvo dn")
    end
  end
  describe "#caesar_cipher" do
    it "Runs caesar cipher with mixed cases and retains proper case" do
      caesar = CaesarCipher.new
      expect(caesar.caesar_cipher("WhAt IsthIIs", 5)).to eql("RcVo DnocDDn")
    end
  end
  describe "#caesar_cipher" do
    it "Runs caesar cipher on full sentence with other characters than letters" do
      caesar = CaesarCipher.new
      expect(caesar.caesar_cipher("WhAt IsthIIs!!. ", 5)).to eql("RcVo DnocDDn!!. ")
    end
  end
end