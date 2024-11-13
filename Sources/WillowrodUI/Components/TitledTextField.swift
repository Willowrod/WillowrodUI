//
//  TitledTextField.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

import SwiftUI
/**
 *
 * TitledTextField
 *
 * Provides text input for different styles in app
 *
 */

public struct TitledTextField: View {
    public init(title: String, value: Binding<String>, error: String? = nil, hint: String = "", protected: Bool = false, autoCapitalised: TextInputAutocapitalization = .never, keyboardType: KeyboardType = .text, textContextType: UITextContentType? = nil, actionX: ( () -> Void)? = nil, isSecured: Bool = false, editing: Bool = false, editAction: @escaping (String) -> Void = {_ in }) {
        self.title = title
        self.value = value
        self.error = error
        self.hint = hint
        self.protected = protected
        self.autoCapitalised = autoCapitalised
        self.keyboardType = keyboardType
        self.textContextType = textContextType
        self.actionX = actionX
        self.editAction = editAction
        self.isSecured = isSecured
        self.editing = editing
    }
    let title: String
    let value: Binding<String>
    var error: String? = nil
    var hint = ""
    var protected: Bool = false
    var autoCapitalised: TextInputAutocapitalization = .never
    var keyboardType: KeyboardType = .text
    var textContextType: UITextContentType? = nil
    var actionX: (() -> Void)? = nil
    var editAction: ((String) -> Void) = {_ in}
    @State private var isSecured: Bool = true
    @State private var editing = false
    public var body: some View {
        return VStack(alignment: .leading, spacing: 2){
            SecondaryText(title, colour: .black)
            ZStack(alignment: .trailing){
                Group{
                    if protected && isSecured {
                        SecureField("", text: value ).foregroundColor(.black).textFieldStyle(CustomTextFieldStyle()).disableAutocorrection(true)
                            .autoCap(type: autoCapitalised)
                    } else {
                        TextField("", text: value, onEditingChanged: {edit in
                            self.editing = edit
                            self.editAction(value.wrappedValue)
                        })
                        .foregroundColor(.black).textFieldStyle(CustomTextFieldStyle()).disableAutocorrection(true)
                        .textContentType(textContextType ?? .none)
                        .autoCap(type: autoCapitalised)
                        .keyboard(type: keyboardType)
                    }
                }.padding(.trailing, 40).background(Color.white).cornerRadius(10).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(scoreColour(error: error), lineWidth: 1)
                )
                HStack{
                    if protected {
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image( self.isSecured ? "ic_show_password" : "ic_hide_password").resizable().frame(width: 20, height: 20).padding(.trailing, 10)
                        }
                    } else if error != nil {
                        Image("ic_field_error").frame(width: 20, height: 20).padding(.trailing, 10)
                    }

                    if !value.wrappedValue.isEmpty {
                        Button(action: {
                            value.wrappedValue = ""
                        }) {
                            Image(systemName: "xmark.circle").resizable().frame(width: 20, height: 20).foregroundColor(Color.gray).padding(.trailing, 10)
                        }
                    }

                }
            }
            SecondaryText( errorOrHint(error: error, hint: hint), size: 12, colour: hintColour(error: error))

        }.padding(.horizontal, 20).padding(.bottom, 20).frame(maxWidth: .infinity, minHeight: 95, maxHeight: 95)
    }

    func scoreColour(error: String?) -> Color{
        if error == nil {
            return .gray
        } else {
            return .red
        }
    }

    func hintColour(error: String?) -> Color{
        if error == nil {
            return .black
        } else {
            return .red
        }
    }

    func errorOrHint(error: String?, hint: String) -> String {
        if let error {
            return error
        } else {
            return hint
        }
    }
}

public struct TitledTextFieldShort: View {
    public init(title: String, value: Binding<String>, keyboardType: KeyboardType = .text, editAction: @escaping (String) -> Void = {_ in }) {
        self.title = title
        self.value = value
        self.editAction = editAction
        self.keyboardType = keyboardType
        self.editing = editing
    }
    let title: String
    let value: Binding<String>
    var error: String? = nil
    var keyboardType: KeyboardType = .text
    var hint = ""
    var editAction: ((String) -> Void) = {_ in}
    @State private var isSecured: Bool = true
    @State private var editing = false
    public var body: some View {
        return VStack(alignment: .leading, spacing: 2){
            SecondaryText(title, colour: .black)
            ZStack(alignment: .trailing){
                Group{

                    TextField("", text: value, onEditingChanged: {edit in
                            self.editing = edit
                        editAction(value.wrappedValue)
                        })
                        .foregroundColor(.black).textFieldStyle(CustomTextFieldStyle()).disableAutocorrection(true)
                        .keyboard(type: keyboardType)
                }.padding(.trailing, 40).background(Color.white).cornerRadius(10).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(scoreColour(error: error), lineWidth: 1)
                )
     
            }
        }.padding(.horizontal, 20).padding(.bottom, 20).frame(maxWidth: .infinity)
    }

    func scoreColour(error: String?) -> Color{
        if error == nil {
            return .gray
        } else {
            return .red
        }
    }

    func hintColour(error: String?) -> Color{
        if error == nil {
            return .black
        } else {
            return .red
        }
    }

    func errorOrHint(error: String?, hint: String) -> String {
        if let error {
            return error
        } else {
            return hint
        }
    }
}

public struct TitledTextEditor: View {
    init(title: String?, value: Binding<String>, error: String? = nil, hint: String = "") {
        self.title = title
        self.value = value
        self.error = error
        self.hint = hint
    }
    let title: String?
    let value: Binding<String>
    var error: String? = nil
    var hint = ""
    public var body: some View {
        return VStack(alignment: .leading, spacing: 2){
            if let title {
                SecondaryText( title, colour: .black)
            }
            TextEditor(text: value).foregroundColor(.black).textFieldStyle(CustomTextFieldStyle()).disableAutocorrection(true).frame(height: 100).cornerRadius(10).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(scoreColour(error: error), lineWidth: 1)
            )
            SecondaryText( errorOrHint(error: error, hint: hint), size: 12, colour: hintColour(error: error))
        }.padding(.horizontal, 20).padding(.bottom, 20).frame(maxWidth: .infinity, minHeight: 120, maxHeight: 120)
    }

    func scoreColour(error: String?) -> Color{
        if error == nil {
            return .gray
        } else {
            return .red
        }
    }

    func hintColour(error: String?) -> Color{
        if error == nil {
            return .black
        } else {
            return .red
        }
    }

    func errorOrHint(error: String?, hint: String) -> String {
        if let error {
            return error
        } else {
            return hint
        }
    }
}



public struct CustomTextFieldStyle: TextFieldStyle {
    @FocusState private var textFieldFocused: Bool
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 10)
            .background(Color.white)
            .frame(height: 30)
            .focused($textFieldFocused)
            .onTapGesture {
                textFieldFocused = true
            }
    }
}

/**
 *
 * TitledDateField
 *
 * Immutable text box to display a date
 *
 * On tap will open a date picker alert box
 *
 */

public struct TitledDateField: View {
    public init(title: String?, value: Binding<String>, error: String? = nil, hint: String = "", date: Binding<Date>, action: (() -> Void)? = nil, editing: Binding<Bool>) {
        self.title = title
        self.value = value
        self.error = error
        self.hint = hint
        self.date = date
        self.action = action
        self.editing = editing
    }
    let title: String?
    var value: Binding<String>
    var error: String? = nil
    var hint = ""
    var date: Binding<Date>
    var action: (() -> Void)? = nil
    var editing: Binding<Bool>
    public var body: some View {
        return VStack(alignment: .leading, spacing: 2){
            if let title {
                SecondaryText( title, colour: .black)
            }
            VStack(alignment: .trailing){
                HStack{
                    SecondaryText( value.wrappedValue.toReadableDate(), size: 16, colour: .black)
                    Spacer()
                    if !value.wrappedValue.isEmpty {
                        Button(action: {
                            value.wrappedValue = ""
                        }) {
                            Image(systemName: "xmark.circle").resizable().frame(width: 20, height: 20).foregroundColor(Color.gray)
                        }
                    }
                }.frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54, alignment: .leading).padding(.leading, 10).padding(.trailing, 10).background(Color.white).cornerRadius(10).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(scoreColour(error: error), lineWidth: 1)
                ).tappable({
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    editing.wrappedValue.toggle()
                })
                if editing.wrappedValue {
                    VStack {
                        DatePicker(selection: date, displayedComponents: [.date], label: {}).onChange(of: date.wrappedValue) { newDate, stuff in
                            value.wrappedValue = newDate.toIsoDate()}.colorScheme(.light).datePickerStyle(.wheel).labelsHidden()
                    }
                }
                if error != nil {
                    Image("ic_field_error").frame(width: 20, height: 20).padding(.trailing, 10)
                }
            }.frame(maxWidth: .infinity)
            SecondaryText( errorOrHint(error: error, hint: hint), size: 12, colour: hintColour(error: error))
        }.padding(.horizontal, 20).frame(maxWidth: .infinity, minHeight: 80)
    }

    func scoreColour(error: String?) -> Color{
        if error == nil {
            return .gray
        } else {
            return .red
        }
    }

    func hintColour(error: String?) -> Color{
        if error == nil {
            return .black
        } else {
            return .red
        }
    }

    func errorOrHint(error: String?, hint: String) -> String {
        if let error {
            return error
        } else {
            return hint
        }
    }
}


public struct TitledTextField_Previews: PreviewProvider {
    @State static var value: String = "A Value"
    @State static var multilineValue: String = "A long value that might eventually bleed over a few lines, this is particularly for the address field........................ Maybe even on to 4 lines, who knows?"
    public static var previews: some View {
        ScrollView{
            VStack(alignment: .leading) {
                TitledTextField(title: "Competency Cloud App", value: $value)
                TitledTextField(title: "Competency Cloud App With Error", value: $value, error: "Error")
                TitledTextField(title: "Competency Cloud App With Hint", value: $value, hint: "Hint")
                TitledTextField(title: "Competency Cloud App With Password", value: $value, hint: "Hint", protected: true)
                TitledTextEditor(title: "Competency Cloud App Multi Line", value: $multilineValue, error: "Error")
                TitledTextEditor(title: nil, value: $multilineValue, error: nil)
            }
        }.frame(maxWidth: .infinity).background(Color.white)
    }
}
